cls

@rem von "v:\Git\iNav\docs\development\Building in Docker.md" 


@rem to setup the docker image..
@rem Auf Lap2
@rem   1) in VSC-Terminal: >docker build -t inav-build .
@rem    => ERROR [7/8] RUN git config --global --add safe.directory /src
@rem   2) in CMD-Konsole: v:\Git\iNav>docker build --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 -t inav-build .
@rem    => installiert ok 
@rem docker build -t inav-build .
@rem docker build --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 -t inav-build .

rem to build iNav..
@rem docker run --rm -it -u root -v <PATH_TO_REPO>:/src inav-build <TARGET>
@rem Option --rm: Automatically remove the container and its associated anonymous volumes when it exits
@rem              recomended, because script always starts a new container
docker run --rm -it -u root -v v:/git/inav:/src inav-build SPEEDYBEEF405WING

@rem falls cache nicht mehr passt: delete .\iNav\build\

@rem If you need to update Settings.md, run:
@rem docker run --entrypoint /src/cmake/docker_docs.sh --rm -it -u root -v <PATH_TO_REPO>:/src inav-build

@rem Building SITL:
@rem docker run --rm --entrypoint /src/cmake/docker_build_sitl.sh -it -u root -v <PATH_TO_REPO>:/src inav-build

@rem Running SITL:
@rem docker run -p 5760:5760 -p 5761:5761 -p 5762:5762 -p 5763:5763 -p 5764:5764 -p 5765:5765 -p 5766:5766 -p 5767:5767 --entrypoint /src/cmake/docker_run_sitl.sh --rm -it -u root -v <PATH_TO_REPO>:/src inav-build.

@rem SITL command line parameters can be adjusted in cmake/docker_run_sitl.sh.

@pause
