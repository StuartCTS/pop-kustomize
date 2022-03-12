# Creates 1 GKE autopilot cluster
# ACTION REQUIRED! Change "project-id-here" value to the project you'll be using
export PROJECT_ID="cc-new-330417"
# Test cluster
echo "creating testcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "testcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async
echo "Creating cluster! Check the UI for progress"