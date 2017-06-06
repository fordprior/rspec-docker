## Set up of this Docker build (Dockerfile + context files):
1. Dockefile for Alpine base image w/ rspec, plus setup of Python script for repo cloning.
2. Python script for repo cloning
3. A little directory w/ a spec file and a supporting file to run a Helloworld Rspec test

## Steps for building:
1. Open the MINGW64 shell that comes with Docker Kinematic
2. Navigate to whatever directory containing your build files
3. Type the following: "docker build -t username/myimage ." (username must be correct; image name doesn't matter)
⋅⋅* This will compile your new image based on the Docker.file and other required files within that directory.
⋅⋅* This image will be available locally, but hasn't yet been pushed to Docker Hub

## Steps for getting container started/stopped:
6. Type 'docker images' to see all the available images on your local machine
7. Type 'docker ps' to see all the containers currently running on your local machine
8. Go ahead and launch your container using the following command: `docker run --name test-run -p 4000:80 -i -t username/myimage /bin/ash`
⋅⋅* This is drop you into a bash session on your newly-started container
⋅⋅* The `-p` is for mapping your machine’s port 4000 to the container’s EXPOSEd port 80 for HTTP
⋅⋅* To get out, type 'exit'.
⋅⋅* To get back in, go back to your Kinematic application and click on 'Exec' for that container and type 'su'
9. Type 'docker stop {CONTAINER ID}` if you ever to stop the container (find CONTAINER ID via `docker ps`)
10. Type `export BASE_URL="{https://yourGitHubUsername:thepersonalaccesstokenyougenerated@github.com/yourOrgName/RepoName.git}"`
⋅⋅* This sets the BASE_URL that is consumed by your python script for repo cloning.
11. Type `cd ..`
12. Type `cd ..`
13. Type `cd usr/src/pythonScript`
14. Type `python clone.py`

## Steps for pushing your container into Docker Hub (for the whole world to see):
1. On your shell, type 'docker login'
2. Enter your username and password as prompted.
3. Type `docker tag my_image username/my_image`
4. Type `docker push username/my_image`

