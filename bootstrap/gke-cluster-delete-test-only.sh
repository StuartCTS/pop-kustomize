# Cleanup script to delete the test cluster created by the gke-cluster-init.sh script
# ACTION REQUIRED! Change "project-id-here" value to the project you'll be using
export PROJECT_ID="cc-new-330417"
# sets the current project for gcloud
gcloud config set project $PROJECT_ID
# Test cluster
echo "Deleting testcluster..."
gcloud container clusters delete testcluster --region "us-central1" --async