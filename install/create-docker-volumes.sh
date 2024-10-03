echo "${_group}Creating volumes for persistent storage ..."

# echo "Created $(docker volume create --name=beatsight-data)."
echo "Created $(docker volume create --name=beatsight-redis)."

echo "${_endgroup}"
