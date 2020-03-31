#!/bin/sh

# ----------------------------------------------------------------------
# This script is an example set of packet filtering rules for the VPN
# endpoint at a peer site connecting to vestasys.org.  Please make
# sure you read and understand it before modifying it for your own
# site.  Consult the iptables(8) man page for more information.

# It's worth noting that the rules set up by this script only filter
# packets going *through* the machine on which it is run.  This does
# not cover packets going directly to the VPN endpoint machine or
# originating from it.

# Author:  Kenneth C. Schalk
# Created: 10-25-2001
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Configuration variables
# ----------------------------------------------------------------------

# This represents the local machines allowed to use the tunnel.
lan="192.168.1.0/24"

# This represents the tunnel interface.  This will match any network
# interface starting with 'ppp', so it may not be appropriate for all
# users.
tunnel="ppp+"

# This is the local Vesta repository.
local_repos="vesta.priv.xorian.net"

# This is the remote Vesta repository.  It's the only one that should
# be talking to us over the tunnel.
remote_repos="dev.vestasys.org"

# ----------------------------------------------------------------------
# Packet filtering rules
# ----------------------------------------------------------------------

# First, get rid of any existing forwarding rules.
iptables -F FORWARD

# Drop anything we don't explicitly accept.
iptables -P FORWARD DROP

# Anything not coming from or going to the LAN gets dropped before we
# do anything else.
iptables -A FORWARD -o $tunnel --source ! $lan -j DROP
iptables -A FORWARD -i $tunnel --destination ! $lan -j DROP

# Anything not coming from or going to the remote repository also gets
# dropped.
iptables -A FORWARD -o $tunnel --destination ! $remote_repos -j DROP
iptables -A FORWARD -i $tunnel --source ! $remote_repos -j DROP

# Allow established connections to continue
iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT

# Allow some ICMP traffic
iptables -A FORWARD --protocol icmp --icmp-type destination-unreachable \
    -j ACCEPT
iptables -A FORWARD --protocol icmp --icmp-type time-exceeded -j ACCEPT
iptables -A FORWARD --protocol icmp --icmp-type echo-reply -j ACCEPT
iptables -A FORWARD --protocol icmp --icmp-type echo-request -j ACCEPT

# Allow new connections from any local machine going out over the
# tunnel
iptables -A FORWARD -o $tunnel --source $lan -m state --state NEW \
    -j ACCEPT

# Allow new connections to the local repository coming in from the
# tunnel.
iptables -A FORWARD -i $tunnel --destination $local_repos \
    -m state --state NEW \
    --protocol tcp --destination-port ! 0:1023 -j ACCEPT

