#!/bin/bash

+gap() {
    echo "Commiting and Pushing"
    git add .
    git commit -m "$(date)"  --allow-empty
    git push
}

+lesson() {
    echo "Creating New Lesson Branch $1"
    slug="$1"

    echo "\n## $slug \n" >> playlist.md

    git checkout -b "$slug"
    git add .
    git commit -m "$(date)" --allow-empty
    git push --set-upstream origin "$slug"
}

+course() {
    echo "Creating a New Course"
    pushd /Users/elliot/Documents/Projects/tutorialedge/courses
        mkdir $1
        cd $1
        gh repo create TutorialEdge/$1 --private  -d $1 -y
    popd
}