# Assignment 14 - Kubernetes Troubleshooting

## 1. kubectl get

![](1a.png)
![](1b.png)
![](1c.png)

## 2. kubectl describe

![](2.png)

## 3. kubectl logs

![](3.png)

## 4. kubectl exec

![](4.png)

## 5. Events

![](5.png)

## 6. kubectl explain, top, get -o wide

`kubectl explain pod.spec.containers` - docs for any YAML field. `kubectl top pods` - CPU / memory (needs Metrics Server). `kubectl get pods -o wide` - node and pod IP.

![](6.png)

## 7. CrashLoopBackOff

Problem: container keeps exiting, kubelet restarts it with a growing delay.
Investigate: `kubectl describe pod` (Exit Code, Last State), `kubectl logs --previous`.
Root cause: the container command exits with code 1.
Fix: correct the command, delete and re-apply the pod.
Verify: `kubectl get pod` shows `Running`.

![](7a.png)
![](7b.png)
![](7c.png)

## 8. ImagePullBackOff / ErrImagePull

Problem: `ErrImagePull` (failed pull), then `ImagePullBackOff` (waiting before the next retry).
Investigate: `kubectl describe pod` - Events say the image / tag was not found.
Root cause: wrong image tag (`nginx:this-image-does-not-exist`).
Fix: use a valid tag, e.g. `nginx:1.27`.
Verify: `kubectl get pod` shows `Running`.

![](8a.png)
![](8b.png)

## 9. Pending Pods

Problem: pod stays `Pending`.
Investigate: `kubectl describe pod` - `FailedScheduling` event.
Root cause: `nodeSelector` points to a node that does not exist (other causes: not enough CPU / memory, taints, unbound PVC).
Fix: remove the `nodeSelector`.
Verify: `kubectl get pod` shows `Running`.

![](9a.png)
![](9b.png)

## 10. ContainerCreating

Problem: pod stuck at `ContainerCreating`.
Investigate: `kubectl describe pod` Events.
Root cause: a referenced ConfigMap / Secret / PVC does not exist (or a big image is still pulling).
Fix: create the missing object or fix its name.
Verify: `kubectl get pod` shows `Running`.

![](10a.png)
![](10b.png)

## 11. Configuration Issues

Problem: `CreateContainerConfigError` or the app crashes on start.
Root cause: missing env var, wrong ConfigMap / Secret key name.
Fix: correct the reference in the YAML, re-apply.
Verify: `kubectl get pod` shows `Running`.

![](11a.png)
![](11b.png)

## 12. Service & DNS Troubleshooting

Problem: Service does not reach the pods.
Investigate: `kubectl get endpoints <svc>` shows `<none>`; `kubectl describe svc` selector vs `kubectl get pods --show-labels`.
Root cause: Service selector does not match the pod labels.
Fix: correct the selector.
Verify: `kubectl get endpoints` lists the pod IPs.

DNS check from inside a pod: `nslookup <service>` and `cat /etc/resolv.conf`. A service in another namespace needs `<service>.<namespace>`.

Pod networking: `kubectl get pod -o wide` for the IP, then `kubectl exec <pod> -- curl <other-pod-ip>` and `curl <service>` - separates a network problem from a DNS problem.

![](12a.png)
![](12b.png)
![](12c.png)
![](12d.png)
![](12e.png)

## 13. Mini Project - Troubleshooting Challenge

| Problem | What I Saw | Command I Used | Root Cause | Fix |
| :-- | :-- | :-- | :-- | :-- |
| Broken pod | ImagePullBackOff | `get`, `describe` | Image tag does not exist | Use a valid tag |
| Service problem | Endpoints `<none>` | `get endpoints`, `describe svc`, `--show-labels` | Selector does not match pod label | Fix selector |

![](13a.png)
![](13b.png)
![](13c.png)
![](13d.png)
![](13e.png)
![](13f.png)
