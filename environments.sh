#
# machine specific config
#

mkdir -p ~/.clutchski

# enable go
which gimme &> /dev/null
if [ $? -eq 0 ]
then
   eval "$(gimme 1.11 &> /dev/null)" 
fi
