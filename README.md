<h1 align="center">
    A basic container image for performing data science reproducibility studies based on Fedora Linux
</h1>

<p align="center">
    <a href="#-build--run">🚀 Build & run</a>
</p>

The repository is devoted to a sample container image built on the top of Fedora Linux that installs some data science dependencies using the "dnf" package manager and runs a python script.

## 🚀 Build & run

### 🐳 Docker

The image can be built using the following command:

```sh
$ docker build --tag ds .
```

Run the image using:

```sh
docker run -it --name ds-container -v "$PWD:/var/ds" ds
```

### 🦦 Podman

The image can be built using the following command:

```sh
$ podman build --tag ds .
```

Run the image using:

```sh
podman run -it --name ds-container -v "$PWD:/var/ds" ds
```

## Disclaimer

This software is provided as-is, and there are no guarantees that it fits your purposes or that it is bug-free. Use it at your own risk!
