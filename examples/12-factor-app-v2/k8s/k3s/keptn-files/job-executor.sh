export JES_VERSION=0.2.3
export JES_NAMESPACE="keptn-jes"

export KEPTN_API_PROTOCOL=http # or https
export KEPTN_API_HOST=keptn.cno-user-01-01.rabbit.commandemy.training # e.g., 1.2.3.4.nip.io
export KEPTN_API_TOKEN=$(kubectl get secret keptn-api-token -n keptn -ojsonpath={.data.keptn-api-token} | base64 --decode)

export TASK_SUBSCRIPTION=sh.keptn.event.deployment.triggered,sh.keptn.event.rollback.triggered,sh.keptn.event.action.triggered,sh.keptn.event.test.triggered