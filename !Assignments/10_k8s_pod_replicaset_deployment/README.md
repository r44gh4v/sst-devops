# Assignment 10 - Kubernetes Pods, ReplicaSets & Deployments

## 1. Cluster Baseline & Standalone Pod

![](1a.png)
![](1b.png)
![](1c.png)

## 2. Service, Port Forwarding, Deployment & Scaling

![](2a.png)
![](2b.png)
![](2c.png)

## 3. Pod Lifecycle States & Probes

![](3.png)

## 4. ReplicaSet, StatefulSet & DaemonSet

![](4a.png)
![](4b.png)
![](4c.png)

## 5. Rolling Updates & Rollback (v1 to v4 to v1)

![](5a.png)
![](5b.png)

## 6. Troubleshooting

![](6a.png)
![](6b.png)

## 7. Blue-Green Deployment

![](7a.png)
![](7b.png)

## 8. Canary Deployment

![](8a.png)
ts took me too many tries
![](8b.png)
![](8c.png)

## 9. Recreate Deployment & the Downtime Window

![](9a.png)
![](9b.png)
![](9c.png)

## 10. ReplicaSet vs Deployment

A ReplicaSet keeps N pods running but keeps no history - to change version you scale one up and the other down yourself.

A Deployment saves the history like version control (revision 1, 2, 3), which is what makes `kubectl rollout undo` work. `--to-revision=1` jumps straight back to v1.

## 11. The 4 Deployment Strategies

| Strategy | What happens |
| :-- | :-- |
| Rolling update | Pods replaced a few at a time. `maxSurge` = pods allowed above the replica count (3 replicas + surge 1 = 4). `maxUnavailable` = pods allowed to be down. |
| Blue-green | Two full environments running, switch traffic between them. Costs double the infrastructure. |
| Canary | Update one server out of ten (~10%), test it, then widen to 40% and more. |
| Recreate | Old pods removed first, new ones start after - there is downtime. |
