echo "${_group}Generating secret key ..."


# This is to escape the secret key to be used in sed below
# Note the need to set LC_ALL=C due to BSD tr and sed always trying to decode
# whatever is passed to them. Kudos to https://stackoverflow.com/a/23584470/90297
SECRET_KEY=$(
  export LC_ALL=C
  head /dev/urandom | tr -dc "a-z0-9@#%^&*(-_=+)" | head -c 50 | sed -e 's/[\/&]/\\&/g'
)
echo "Secret key: $SECRET_KEY"


echo "${_endgroup}"
