## BUILDING
##   (from project root directory)
##   $ docker build -t python-for-andreslopezalbin-eventos-app-backend .
##
## RUNNING
##   $ docker run python-for-andreslopezalbin-eventos-app-backend

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="he3q6qw" \
    STACKSMITH_STACK_NAME="Python for andreslopezalbin/eventos-app-backend" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install python-2.7.12-1 --checksum 1ab49b32453c509cf6ff3abb9dbe8a411053e3b811753a10c7a77b4bc19606df

ENV PATH=/opt/bitnami/python/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Django template
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
