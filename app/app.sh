#!/bin/sh
# Application that prints student information.
# Values come from environment variables (defaults are used if they are not set).

NAME="${STUDENT_NAME:-Madi}"
SURNAME="${STUDENT_SURNAME:-Bolatov}"
GROUP="${STUDENT_GROUP:-IT2-2308}"
ID="${STUDENT_ID:-41511}"

echo "================================"
echo "DevOps Student Application"
echo "================================"
echo
echo "Name: $NAME"
echo "Surname: $SURNAME"
echo "Group: $GROUP"
echo "Student ID: $ID"
echo
echo "Application is running successfully!"
