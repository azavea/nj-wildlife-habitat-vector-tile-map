DIR="$(dirname "$0")"

${DIR}/download-data.sh && \
    ${DIR}/convert-data.sh && \
    ${DIR}/process-data.sh && \
    ${DIR}/prepare-app-data.sh
