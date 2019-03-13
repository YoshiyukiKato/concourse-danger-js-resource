FROM yoshiyuki/danger-js
RUN apk add --update --upgrade --no-cache jq bash git
ADD assets /opt/resource
RUN chmod +x /opt/resource/*
ENTRYPOINT ["/bin/bash"]
