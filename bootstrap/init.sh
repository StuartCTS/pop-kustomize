# Initilize set project ID variable and run various initializations
# ACTION REQUIRED! Change "project-id-here" value to the project you'll be using
export PROJECT_ID="cc-new-330417"
# sets the current project for gcloud
gcloud config set project $PROJECT_ID
# Enables various APIs you'll need
gcloud services enable container.googleapis.com cloudbuild.googleapis.com \
artifactregistry.googleapis.com clouddeploy.googleapis.com \
cloudresourcemanager.googleapis.com
# add the clouddeploy.jobRunner role to your compute service account
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --role="roles/clouddeploy.jobRunner"
# add the Kubernetes developer permission:
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --role="roles/container.developer"
# creates the Artifact Registry repo
gcloud artifacts repositories create pop-stats --location=us-central1 \
--repository-format=docker
# creates the Google Cloud Deploy pipeline
gcloud deploy apply --file clouddeploy.yaml \
--region=us-central1 --project=$PROJECT_ID
echo "init done. To create clusters, run: ./gke-cluster-init.sh"
