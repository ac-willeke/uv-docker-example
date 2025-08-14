REM
REM Build and run the example Docker image.
REM
REM Mounts the local project directory to reflect a common development workflow.
REM
REM The `docker run` command uses the following options:
REM
REM   --rm                        Remove the container after exiting
REM   -v "%CD%:/app"              Mount the current directory to `/app` so code changes don't require an image rebuild
REM   -v "/app/.venv"             Mount the virtual environment separately, so the developer's environment doesn't end up in the container
REM   -it                         Interactive terminal if available
REM   %%i                         Build the image, then use it as a run target
REM   uv run uv_docker_example    Run the hello script in the container

@echo off
REM Build and run the example Docker image for Windows

REM Detect if running in an interactive terminal
SET INTERACTIVE=
IF "%TERM%"=="" (
    REM Not a known interactive terminal, leave INTERACTIVE empty
) ELSE (
    SET INTERACTIVE=-it
)

FOR /F "delims=" %%i IN ('docker build -q .') DO (
    docker run --rm -v "%CD%:/app" -v "/app/.venv" %INTERACTIVE% %%i uv run uv_docker_example
)
