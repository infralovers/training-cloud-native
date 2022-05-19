microk8s helm3 install chaos-mesh helm/chaos-mesh \
				--create-namespace \
				--namespace=chaos-testing \
				--set chaosDaemon.runtime=containerd \
				--set chaosDaemon.socketPath=/var/snap/microk8s/common/run/containerd.sock

