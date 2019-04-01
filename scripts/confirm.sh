read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # continue
    exit 0
else
    # error
    exit 1
fi
