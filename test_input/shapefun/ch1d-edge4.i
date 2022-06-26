// this is a test input file for mesh generation test

[mesh]
  type=asfem
  dim=1
  nx=100
  meshtype=edge4
[end]

[dofs]
name=c mu
[end]

[qpoint]
  // for quad9 mesh, the order must>=4 !!!
  type=gauss
  order=4
[end]

[elmts]
  [elmt1]
    type=cahnhilliard
    dofs=c mu
    mate=mate1
  [end]
[end]

[mates]
  [mate1]
    type=idealsolution
    params=1.0 2.5 0.002
  [end]
[end]

[timestepping]
  type=be
  dt=1.0e-5
  time=2.0e-5
  optiters=3
  growthfactor=1.2
  adaptive=true
  dtmin=1.0e-8
  dtmax=1.0e1
[end]

[nonlinearsolver]
  type=newtonls
  maxiters=50
  r_rel_tol=1.0e-8
  r_abs_tol=1.0e-7
[end]

[projection]
vectormate=gradc
[end]

[ics]
  [randc]
    type=random
    dof=c
    params=0.45 0.55
  [end]
[end]

[job]
  type=transient
  debug=dep
[end]