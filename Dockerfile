FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip git ca-certificates \
    chromium chromium-driver \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir robotframework --break-system-packages \
 && pip3 install --no-cache-dir selenium robotframework-seleniumlibrary --break-system-packages

USER jenkins
