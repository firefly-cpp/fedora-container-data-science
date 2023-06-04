# pull the latest stable Fedora Linux instance; currently, Fedora 38 is the latest
FROM registry.fedoraproject.org/fedora:38

ENV NAME=fedora-data-science-basic VERSION=0 ARCH=x86_64

LABEL org.label-schema="$NAME" \
     name="$FGC/$NAME" \
     version="$VERSION" \
     architecture="$ARCH" \
     run="podman run -it IMAGE" \
     maintainer="Iztok Fister, Jr. <iztok@iztok-jr-fister.eu>" \
     url="https://github.com/firefly-cpp/fedora-container-data-science" \
     summary="A basic container image for performing data science reproducibility studies based on Fedora Linux." \
     description="A basic container image for performing data science reproducibility studies based on Fedora Linux."

# set a workdir where we will also collect the results of python scripts
WORKDIR /var/ds/

# INSTALL THE FOLLOWING PYTHON PACKAGES
#   * niapy: Python microframework for building nature-inspired algorithms | https://github.com/NiaOrg/NiaPy
#   * niaarm: A minimalistic framework for Numerical Association Rule Mining  | https://github.com/firefly-cpp/NiaARM
#   * sport-activities-features: A minimalistic toolbox for extracting features from sports activity files written in Python | https://github.com/firefly-cpp/sport-activities-features
# install also git package for cloning the dataset
ENV PACKAGES="\
    python-niapy \
    python-niaarm \
    python-sport-activities-features \
    git-core \
"
# installing several data science packages and clone datasets
RUN dnf -y update && dnf -y install $PACKAGES && dnf clean all \
     && git clone https://github.com/firefly-cpp/tcx-test-files.git

# copy our Python script to extract metrics from the files [ a straightforward example]
COPY extract_metrics.py .
# run script
RUN python3 extract_metrics.py
# open the shell to explore the results...
CMD ["/bin/sh"]
