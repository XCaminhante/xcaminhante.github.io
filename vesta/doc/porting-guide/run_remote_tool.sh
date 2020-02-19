#!/bin/sh
# Copyright (C) 2001, Compaq Computer Corporation
# 
# This file is part of Vesta.
# 
# Vesta is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
# 
# Vesta is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with Vesta; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


# tool_launcher_filter
#
# Filter command line to tool_launcher and redirect it to another
# host using rsh.
#
# We have only file descriptors 0, 1, 2 available, so:
#   Suppress -dbg flag
#   Change -err flag to -err 2 always
# The latter confounds errors in launching the tool with errors
# printed on the tool's standard error.  We can live with that 
# temporarily.

# ----------------------------------------------------------------------
# Parameters controlling this script.  Adjust as needed.
# ----------------------------------------------------------------------

# The host on which to run tools
host=host.example.com

# The user to run tools as
user=`vgetconfig Repository runtool_user | sed -e 's/@.*//'`

# The path of the tool_launcher on the remote host
launcher=/usr/local/vesta/bin/tool_launcher

# The command to use to execute the tool_launcher on the remote host
#rsh=/usr/bin/rsh
rsh=/usr/bin/ssh

# ----------------------------------------------------------------------

while [ $# -gt 0 ] ; do
  case $1 in
    -dbg)  shift; dbg=$1 ;;
    -t)    t=-t ;;
    -err)  shift; err=$1 ;;
    -root) shift; root=$1 ;;
    -env)  break; ;;
  esac
  shift
done

exec $rsh -l $user $host cd `pwd` \; exec $launcher $t -err 2 -root $root $*
