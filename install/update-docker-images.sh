echo "${_group}Fetching and updating Docker images ..."

echo "BEATSIGHT IMAGE: ${BEATSIGHT_IMAGE}"
# We may not have the set image on the repo (local images) so allow fails
docker pull ${BEATSIGHT_IMAGE} || true

echo "${_endgroup}"
