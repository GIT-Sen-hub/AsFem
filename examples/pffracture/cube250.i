[mesh]
  type=gmsh
  file=cube250.msh
  savemesh=true
[end]

[dofs]
name=d ux uy uz
[end]

[nonlinearsolver]
  type=newton
  maxiters=25
  r_rel_tol=1.0e-10
  r_abs_tol=5.5e-7
  //solver=superlu
[end]

[ics]
  [constd]
    type=const
    dof=d
    params=0.0
  [end]
[end]

[output]
  type=vtu
  interval=10
[end]

[timestepping]
  type=be
  dt=2.0e-5
  time=4.0e-1
  adaptive=true
  optiters=5
  growthfactor=1.2
  cutfactor=0.85
  dtmin=1.0e-16
  dtmax=1.0e-3
[end]

[bcs]
  [fixux]
    type=dirichlet
    dofs=ux
    value=0.0
    boundary=left
  [end]
  [fixuy]
    type=dirichlet
    dofs=uy
    value=0.0
    boundary=bottom
  [end]
  [fixuz]
    type=dirichlet
    dofs=uz
    value=0.0
    boundary=back
  [end]
  [load]
    type=dirichlet
    dofs=uz
    value=1.0*t
    boundary=front
  [end]
[end]

[projection]
scalarmate=vonMises
[end]

[job]
  type=transient
  debug=dep
[end]


//***************************************************
[elmts]
  [myelmt1]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate1
    domain=1
  [end]
  [myelmt2]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate2
    domain=2
  [end]
  [myelmt3]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate3
    domain=3
  [end]
  [myelmt4]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate4
    domain=4
  [end]
  [myelmt5]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate5
    domain=5
  [end]
  [myelmt6]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate6
    domain=6
  [end]
  [myelmt7]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate7
    domain=7
  [end]
  [myelmt8]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate8
    domain=8
  [end]
  [myelmt9]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate9
    domain=9
  [end]
  [myelmt10]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate10
    domain=10
  [end]
  [myelmt11]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate11
    domain=11
  [end]
  [myelmt12]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate12
    domain=12
  [end]
  [myelmt13]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate13
    domain=13
  [end]
  [myelmt14]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate14
    domain=14
  [end]
  [myelmt15]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate15
    domain=15
  [end]
  [myelmt16]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate16
    domain=16
  [end]
  [myelmt17]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate17
    domain=17
  [end]
  [myelmt18]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate18
    domain=18
  [end]
  [myelmt19]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate19
    domain=19
  [end]
  [myelmt20]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate20
    domain=20
  [end]
  [myelmt21]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate21
    domain=21
  [end]
  [myelmt22]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate22
    domain=22
  [end]
  [myelmt23]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate23
    domain=23
  [end]
  [myelmt24]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate24
    domain=24
  [end]
  [myelmt25]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate25
    domain=25
  [end]
  [myelmt26]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate26
    domain=26
  [end]
  [myelmt27]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate27
    domain=27
  [end]
  [myelmt28]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate28
    domain=28
  [end]
  [myelmt29]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate29
    domain=29
  [end]
  [myelmt30]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate30
    domain=30
  [end]
  [myelmt31]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate31
    domain=31
  [end]
  [myelmt32]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate32
    domain=32
  [end]
  [myelmt33]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate33
    domain=33
  [end]
  [myelmt34]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate34
    domain=34
  [end]
  [myelmt35]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate35
    domain=35
  [end]
  [myelmt36]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate36
    domain=36
  [end]
  [myelmt37]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate37
    domain=37
  [end]
  [myelmt38]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate38
    domain=38
  [end]
  [myelmt39]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate39
    domain=39
  [end]
  [myelmt40]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate40
    domain=40
  [end]
  [myelmt41]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate41
    domain=41
  [end]
  [myelmt42]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate42
    domain=42
  [end]
  [myelmt43]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate43
    domain=43
  [end]
  [myelmt44]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate44
    domain=44
  [end]
  [myelmt45]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate45
    domain=45
  [end]
  [myelmt46]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate46
    domain=46
  [end]
  [myelmt47]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate47
    domain=47
  [end]
  [myelmt48]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate48
    domain=48
  [end]
  [myelmt49]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate49
    domain=49
  [end]
  [myelmt50]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate50
    domain=50
  [end]
  [myelmt51]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate51
    domain=51
  [end]
  [myelmt52]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate52
    domain=52
  [end]
  [myelmt53]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate53
    domain=53
  [end]
  [myelmt54]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate54
    domain=54
  [end]
  [myelmt55]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate55
    domain=55
  [end]
  [myelmt56]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate56
    domain=56
  [end]
  [myelmt57]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate57
    domain=57
  [end]
  [myelmt58]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate58
    domain=58
  [end]
  [myelmt59]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate59
    domain=59
  [end]
  [myelmt60]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate60
    domain=60
  [end]
  [myelmt61]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate61
    domain=61
  [end]
  [myelmt62]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate62
    domain=62
  [end]
  [myelmt63]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate63
    domain=63
  [end]
  [myelmt64]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate64
    domain=64
  [end]
  [myelmt65]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate65
    domain=65
  [end]
  [myelmt66]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate66
    domain=66
  [end]
  [myelmt67]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate67
    domain=67
  [end]
  [myelmt68]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate68
    domain=68
  [end]
  [myelmt69]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate69
    domain=69
  [end]
  [myelmt70]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate70
    domain=70
  [end]
  [myelmt71]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate71
    domain=71
  [end]
  [myelmt72]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate72
    domain=72
  [end]
  [myelmt73]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate73
    domain=73
  [end]
  [myelmt74]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate74
    domain=74
  [end]
  [myelmt75]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate75
    domain=75
  [end]
  [myelmt76]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate76
    domain=76
  [end]
  [myelmt77]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate77
    domain=77
  [end]
  [myelmt78]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate78
    domain=78
  [end]
  [myelmt79]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate79
    domain=79
  [end]
  [myelmt80]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate80
    domain=80
  [end]
  [myelmt81]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate81
    domain=81
  [end]
  [myelmt82]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate82
    domain=82
  [end]
  [myelmt83]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate83
    domain=83
  [end]
  [myelmt84]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate84
    domain=84
  [end]
  [myelmt85]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate85
    domain=85
  [end]
  [myelmt86]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate86
    domain=86
  [end]
  [myelmt87]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate87
    domain=87
  [end]
  [myelmt88]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate88
    domain=88
  [end]
  [myelmt89]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate89
    domain=89
  [end]
  [myelmt90]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate90
    domain=90
  [end]
  [myelmt91]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate91
    domain=91
  [end]
  [myelmt92]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate92
    domain=92
  [end]
  [myelmt93]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate93
    domain=93
  [end]
  [myelmt94]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate94
    domain=94
  [end]
  [myelmt95]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate95
    domain=95
  [end]
  [myelmt96]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate96
    domain=96
  [end]
  [myelmt97]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate97
    domain=97
  [end]
  [myelmt98]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate98
    domain=98
  [end]
  [myelmt99]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate99
    domain=99
  [end]
  [myelmt100]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate100
    domain=100
  [end]
  [myelmt101]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate101
    domain=101
  [end]
  [myelmt102]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate102
    domain=102
  [end]
  [myelmt103]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate103
    domain=103
  [end]
  [myelmt104]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate104
    domain=104
  [end]
  [myelmt105]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate105
    domain=105
  [end]
  [myelmt106]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate106
    domain=106
  [end]
  [myelmt107]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate107
    domain=107
  [end]
  [myelmt108]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate108
    domain=108
  [end]
  [myelmt109]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate109
    domain=109
  [end]
  [myelmt110]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate110
    domain=110
  [end]
  [myelmt111]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate111
    domain=111
  [end]
  [myelmt112]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate112
    domain=112
  [end]
  [myelmt113]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate113
    domain=113
  [end]
  [myelmt114]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate114
    domain=114
  [end]
  [myelmt115]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate115
    domain=115
  [end]
  [myelmt116]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate116
    domain=116
  [end]
  [myelmt117]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate117
    domain=117
  [end]
  [myelmt118]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate118
    domain=118
  [end]
  [myelmt119]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate119
    domain=119
  [end]
  [myelmt120]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate120
    domain=120
  [end]
  [myelmt121]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate121
    domain=121
  [end]
  [myelmt122]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate122
    domain=122
  [end]
  [myelmt123]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate123
    domain=123
  [end]
  [myelmt124]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate124
    domain=124
  [end]
  [myelmt125]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate125
    domain=125
  [end]
  [myelmt126]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate126
    domain=126
  [end]
  [myelmt127]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate127
    domain=127
  [end]
  [myelmt128]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate128
    domain=128
  [end]
  [myelmt129]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate129
    domain=129
  [end]
  [myelmt130]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate130
    domain=130
  [end]
  [myelmt131]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate131
    domain=131
  [end]
  [myelmt132]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate132
    domain=132
  [end]
  [myelmt133]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate133
    domain=133
  [end]
  [myelmt134]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate134
    domain=134
  [end]
  [myelmt135]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate135
    domain=135
  [end]
  [myelmt136]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate136
    domain=136
  [end]
  [myelmt137]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate137
    domain=137
  [end]
  [myelmt138]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate138
    domain=138
  [end]
  [myelmt139]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate139
    domain=139
  [end]
  [myelmt140]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate140
    domain=140
  [end]
  [myelmt141]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate141
    domain=141
  [end]
  [myelmt142]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate142
    domain=142
  [end]
  [myelmt143]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate143
    domain=143
  [end]
  [myelmt144]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate144
    domain=144
  [end]
  [myelmt145]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate145
    domain=145
  [end]
  [myelmt146]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate146
    domain=146
  [end]
  [myelmt147]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate147
    domain=147
  [end]
  [myelmt148]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate148
    domain=148
  [end]
  [myelmt149]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate149
    domain=149
  [end]
  [myelmt150]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate150
    domain=150
  [end]
  [myelmt151]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate151
    domain=151
  [end]
  [myelmt152]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate152
    domain=152
  [end]
  [myelmt153]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate153
    domain=153
  [end]
  [myelmt154]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate154
    domain=154
  [end]
  [myelmt155]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate155
    domain=155
  [end]
  [myelmt156]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate156
    domain=156
  [end]
  [myelmt157]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate157
    domain=157
  [end]
  [myelmt158]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate158
    domain=158
  [end]
  [myelmt159]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate159
    domain=159
  [end]
  [myelmt160]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate160
    domain=160
  [end]
  [myelmt161]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate161
    domain=161
  [end]
  [myelmt162]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate162
    domain=162
  [end]
  [myelmt163]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate163
    domain=163
  [end]
  [myelmt164]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate164
    domain=164
  [end]
  [myelmt165]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate165
    domain=165
  [end]
  [myelmt166]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate166
    domain=166
  [end]
  [myelmt167]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate167
    domain=167
  [end]
  [myelmt168]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate168
    domain=168
  [end]
  [myelmt169]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate169
    domain=169
  [end]
  [myelmt170]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate170
    domain=170
  [end]
  [myelmt171]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate171
    domain=171
  [end]
  [myelmt172]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate172
    domain=172
  [end]
  [myelmt173]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate173
    domain=173
  [end]
  [myelmt174]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate174
    domain=174
  [end]
  [myelmt175]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate175
    domain=175
  [end]
  [myelmt176]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate176
    domain=176
  [end]
  [myelmt177]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate177
    domain=177
  [end]
  [myelmt178]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate178
    domain=178
  [end]
  [myelmt179]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate179
    domain=179
  [end]
  [myelmt180]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate180
    domain=180
  [end]
  [myelmt181]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate181
    domain=181
  [end]
  [myelmt182]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate182
    domain=182
  [end]
  [myelmt183]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate183
    domain=183
  [end]
  [myelmt184]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate184
    domain=184
  [end]
  [myelmt185]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate185
    domain=185
  [end]
  [myelmt186]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate186
    domain=186
  [end]
  [myelmt187]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate187
    domain=187
  [end]
  [myelmt188]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate188
    domain=188
  [end]
  [myelmt189]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate189
    domain=189
  [end]
  [myelmt190]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate190
    domain=190
  [end]
  [myelmt191]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate191
    domain=191
  [end]
  [myelmt192]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate192
    domain=192
  [end]
  [myelmt193]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate193
    domain=193
  [end]
  [myelmt194]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate194
    domain=194
  [end]
  [myelmt195]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate195
    domain=195
  [end]
  [myelmt196]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate196
    domain=196
  [end]
  [myelmt197]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate197
    domain=197
  [end]
  [myelmt198]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate198
    domain=198
  [end]
  [myelmt199]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate199
    domain=199
  [end]
  [myelmt200]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate200
    domain=200
  [end]
  [myelmt201]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate201
    domain=201
  [end]
  [myelmt202]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate202
    domain=202
  [end]
  [myelmt203]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate203
    domain=203
  [end]
  [myelmt204]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate204
    domain=204
  [end]
  [myelmt205]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate205
    domain=205
  [end]
  [myelmt206]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate206
    domain=206
  [end]
  [myelmt207]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate207
    domain=207
  [end]
  [myelmt208]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate208
    domain=208
  [end]
  [myelmt209]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate209
    domain=209
  [end]
  [myelmt210]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate210
    domain=210
  [end]
  [myelmt211]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate211
    domain=211
  [end]
  [myelmt212]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate212
    domain=212
  [end]
  [myelmt213]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate213
    domain=213
  [end]
  [myelmt214]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate214
    domain=214
  [end]
  [myelmt215]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate215
    domain=215
  [end]
  [myelmt216]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate216
    domain=216
  [end]
  [myelmt217]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate217
    domain=217
  [end]
  [myelmt218]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate218
    domain=218
  [end]
  [myelmt219]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate219
    domain=219
  [end]
  [myelmt220]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate220
    domain=220
  [end]
  [myelmt221]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate221
    domain=221
  [end]
  [myelmt222]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate222
    domain=222
  [end]
  [myelmt223]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate223
    domain=223
  [end]
  [myelmt224]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate224
    domain=224
  [end]
  [myelmt225]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate225
    domain=225
  [end]
  [myelmt226]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate226
    domain=226
  [end]
  [myelmt227]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate227
    domain=227
  [end]
  [myelmt228]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate228
    domain=228
  [end]
  [myelmt229]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate229
    domain=229
  [end]
  [myelmt230]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate230
    domain=230
  [end]
  [myelmt231]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate231
    domain=231
  [end]
  [myelmt232]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate232
    domain=232
  [end]
  [myelmt233]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate233
    domain=233
  [end]
  [myelmt234]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate234
    domain=234
  [end]
  [myelmt235]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate235
    domain=235
  [end]
  [myelmt236]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate236
    domain=236
  [end]
  [myelmt237]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate237
    domain=237
  [end]
  [myelmt238]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate238
    domain=238
  [end]
  [myelmt239]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate239
    domain=239
  [end]
  [myelmt240]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate240
    domain=240
  [end]
  [myelmt241]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate241
    domain=241
  [end]
  [myelmt242]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate242
    domain=242
  [end]
  [myelmt243]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate243
    domain=243
  [end]
  [myelmt244]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate244
    domain=244
  [end]
  [myelmt245]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate245
    domain=245
  [end]
  [myelmt246]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate246
    domain=246
  [end]
  [myelmt247]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate247
    domain=247
  [end]
  [myelmt248]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate248
    domain=248
  [end]
  [myelmt249]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate249
    domain=249
  [end]
  [myelmt250]
    type=miehefrac
    dofs=d ux uy uz
    mate=mymate250
    domain=250
  [end]
[end]


[mates]
  [mymate1]
    type=miehefracmate
    params= 1.4154e+02  9.5676e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate2]
    type=miehefracmate
    params= 1.3956e+02  9.9508e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate3]
    type=miehefracmate
    params= 1.2207e+02  5.9755e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate4]
    type=miehefracmate
    params= 5.3292e+01  7.9985e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate5]
    type=miehefracmate
    params= 1.0341e+02  9.1908e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate6]
    type=miehefracmate
    params= 1.7537e+02  4.8822e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate7]
    type=miehefracmate
    params= 1.0661e+02  6.0360e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate8]
    type=miehefracmate
    params= 1.5627e+02  8.9600e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate9]
    type=miehefracmate
    params= 1.0484e+02  7.7786e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate10]
    type=miehefracmate
    params= 1.2417e+02  1.6056e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate11]
    type=miehefracmate
    params= 9.1660e+01  8.8927e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate12]
    type=miehefracmate
    params= 9.9749e+01  9.1037e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate13]
    type=miehefracmate
    params= 1.1322e+02  7.7306e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate14]
    type=miehefracmate
    params= 1.0939e+02  7.0485e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate15]
    type=miehefracmate
    params= 1.4089e+02  6.6518e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate16]
    type=miehefracmate
    params= 9.2102e+01  8.5917e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate17]
    type=miehefracmate
    params= 9.5371e+01  1.0270e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate18]
    type=miehefracmate
    params= 1.3956e+02  5.2596e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate19]
    type=miehefracmate
    params= 6.4675e+01  1.1564e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate20]
    type=miehefracmate
    params= 1.3414e+02  8.8433e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate21]
    type=miehefracmate
    params= 1.7888e+02  9.8046e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate22]
    type=miehefracmate
    params= 1.4598e+02  7.0170e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate23]
    type=miehefracmate
    params= 1.2711e+02  9.6468e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate24]
    type=miehefracmate
    params= 1.7266e+02  8.6708e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate25]
    type=miehefracmate
    params= 1.3296e+02  1.0077e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate26]
    type=miehefracmate
    params= 1.3828e+02  1.2055e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate27]
    type=miehefracmate
    params= 8.8432e+01  8.8737e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate28]
    type=miehefracmate
    params= 1.4402e+02  7.6280e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate29]
    type=miehefracmate
    params= 1.0824e+02  9.8488e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate30]
    type=miehefracmate
    params= 1.5275e+02  1.0765e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate31]
    type=miehefracmate
    params= 1.0670e+02  3.8949e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate32]
    type=miehefracmate
    params= 1.3974e+02  6.1566e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate33]
    type=miehefracmate
    params= 1.4604e+02  1.1006e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate34]
    type=miehefracmate
    params= 1.6284e+02  8.6157e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate35]
    type=miehefracmate
    params= 1.1832e+02  8.6512e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate36]
    type=miehefracmate
    params= 8.3315e+01  7.8833e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate37]
    type=miehefracmate
    params= 1.1671e+02  4.0002e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate38]
    type=miehefracmate
    params= 1.3684e+02  4.8861e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate39]
    type=miehefracmate
    params= 1.1671e+02  9.7611e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate40]
    type=miehefracmate
    params= 1.5600e+02  5.7544e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate41]
    type=miehefracmate
    params= 1.5466e+02  1.0289e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate42]
    type=miehefracmate
    params= 1.3256e+02  8.7300e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate43]
    type=miehefracmate
    params= 8.5278e+01  9.1364e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate44]
    type=miehefracmate
    params= 1.3371e+02  3.1371e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate45]
    type=miehefracmate
    params= 7.2400e+01  1.3328e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate46]
    type=miehefracmate
    params= 1.8963e+02  6.1829e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate47]
    type=miehefracmate
    params= 1.4794e+02  6.1780e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate48]
    type=miehefracmate
    params= 1.6040e+02  9.3833e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate49]
    type=miehefracmate
    params= 1.6154e+02  1.1553e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate50]
    type=miehefracmate
    params= 1.7161e+02  1.0683e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate51]
    type=miehefracmate
    params= 1.7261e+02  8.5392e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate52]
    type=miehefracmate
    params= 1.0894e+02  1.0580e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate53]
    type=miehefracmate
    params= 6.5682e+01  1.3091e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate54]
    type=miehefracmate
    params= 1.4577e+02  8.6445e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate55]
    type=miehefracmate
    params= 9.2419e+01  6.4871e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate56]
    type=miehefracmate
    params= 1.4355e+02  1.2019e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate57]
    type=miehefracmate
    params= 1.2181e+02  7.7820e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate58]
    type=miehefracmate
    params= 1.2927e+02  9.1158e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate59]
    type=miehefracmate
    params= 1.2620e+02  7.0892e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate60]
    type=miehefracmate
    params= 1.1264e+02  6.6224e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate61]
    type=miehefracmate
    params= 1.2343e+02  8.4109e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate62]
    type=miehefracmate
    params= 9.7313e+01  8.3961e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate63]
    type=miehefracmate
    params= 1.6610e+02  9.4229e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate64]
    type=miehefracmate
    params= 6.4869e+01  9.1474e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate65]
    type=miehefracmate
    params= 1.3644e+02  8.8954e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate66]
    type=miehefracmate
    params= 1.0686e+02  9.9134e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate67]
    type=miehefracmate
    params= 1.0659e+02  9.9182e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate68]
    type=miehefracmate
    params= 7.9755e+01  8.6238e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate69]
    type=miehefracmate
    params= 1.1133e+02  6.6666e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate70]
    type=miehefracmate
    params= 1.0597e+02  9.9419e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate71]
    type=miehefracmate
    params= 1.6878e+02  4.1545e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate72]
    type=miehefracmate
    params= 8.3705e+01  8.3970e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate73]
    type=miehefracmate
    params= 1.6085e+02  7.4874e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate74]
    type=miehefracmate
    params= 1.4416e+02  1.1153e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate75]
    type=miehefracmate
    params= 6.4378e+01  9.6142e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate76]
    type=miehefracmate
    params= 1.3020e+02  9.7906e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate77]
    type=miehefracmate
    params= 1.0368e+02  8.6331e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate78]
    type=miehefracmate
    params= 1.0811e+02  9.0399e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate79]
    type=miehefracmate
    params= 8.6091e+01  8.1756e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate80]
    type=miehefracmate
    params= 9.4991e+01  6.8982e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate81]
    type=miehefracmate
    params= 1.0061e+02  1.0254e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate82]
    type=miehefracmate
    params= 9.6512e+01  4.6911e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate83]
    type=miehefracmate
    params= 9.4326e+01  1.2730e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate84]
    type=miehefracmate
    params= 1.1992e+02  9.6864e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate85]
    type=miehefracmate
    params= 1.1237e+02  7.4315e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate86]
    type=miehefracmate
    params= 9.8958e+01  9.5071e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate87]
    type=miehefracmate
    params= 1.6480e+02  3.4521e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate88]
    type=miehefracmate
    params= 1.2518e+02  1.1674e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate89]
    type=miehefracmate
    params= 1.3915e+02  7.2566e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate90]
    type=miehefracmate
    params= 1.2454e+02  1.4173e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate91]
    type=miehefracmate
    params= 7.7496e+01  9.4236e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate92]
    type=miehefracmate
    params= 1.3094e+02  5.0250e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate93]
    type=miehefracmate
    params= 5.6926e+01  8.4724e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate94]
    type=miehefracmate
    params= 1.1630e+02  1.0420e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate95]
    type=miehefracmate
    params= 1.0033e+02  4.0581e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate96]
    type=miehefracmate
    params= 1.6616e+02  7.7021e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate97]
    type=miehefracmate
    params= 1.4205e+02  8.5547e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate98]
    type=miehefracmate
    params= 1.1904e+02  3.8752e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate99]
    type=miehefracmate
    params= 1.3643e+02  1.0493e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate100]
    type=miehefracmate
    params= 1.3125e+02  7.8141e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate101]
    type=miehefracmate
    params= 1.1906e+02  8.4258e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate102]
    type=miehefracmate
    params= 6.6093e+01  1.1047e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate103]
    type=miehefracmate
    params= 1.6405e+02  1.0599e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate104]
    type=miehefracmate
    params= 1.4012e+02  9.4632e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate105]
    type=miehefracmate
    params= 1.0268e+02  1.0422e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate106]
    type=miehefracmate
    params= 1.1620e+02  5.4097e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate107]
    type=miehefracmate
    params= 1.2729e+02  1.1193e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate108]
    type=miehefracmate
    params= 1.6489e+02  6.8541e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate109]
    type=miehefracmate
    params= 1.2124e+02  7.0951e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate110]
    type=miehefracmate
    params= 1.1917e+02  4.8496e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate111]
    type=miehefracmate
    params= 1.7522e+02  8.7913e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate112]
    type=miehefracmate
    params= 1.6160e+02  6.4570e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate113]
    type=miehefracmate
    params= 1.2171e+02  7.7727e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate114]
    type=miehefracmate
    params= 7.5696e+01  9.2100e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate115]
    type=miehefracmate
    params= 9.6035e+01  7.5074e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate116]
    type=miehefracmate
    params= 1.1396e+02  6.1845e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate117]
    type=miehefracmate
    params= 8.2591e+01  5.3467e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate118]
    type=miehefracmate
    params= 1.2142e+02  1.3461e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate119]
    type=miehefracmate
    params= 1.1826e+02  7.8560e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate120]
    type=miehefracmate
    params= 6.0604e+01  2.3947e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate121]
    type=miehefracmate
    params= 1.5206e+02  1.2498e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate122]
    type=miehefracmate
    params= 1.3882e+02  5.8230e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate123]
    type=miehefracmate
    params= 1.8412e+02  9.8308e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate124]
    type=miehefracmate
    params= 9.7636e+01  5.5286e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate125]
    type=miehefracmate
    params= 9.4439e+01  6.3363e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate126]
    type=miehefracmate
    params= 1.0630e+02  8.1447e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate127]
    type=miehefracmate
    params= 1.0118e+02  1.2958e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate128]
    type=miehefracmate
    params= 9.6521e+01  1.0544e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate129]
    type=miehefracmate
    params= 7.6077e+01  1.4132e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate130]
    type=miehefracmate
    params= 1.2396e+02  1.0673e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate131]
    type=miehefracmate
    params= 1.4699e+02  1.0273e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate132]
    type=miehefracmate
    params= 1.0842e+02  9.6008e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate133]
    type=miehefracmate
    params= 9.5256e+01  1.0847e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate134]
    type=miehefracmate
    params= 1.4533e+02  7.1436e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate135]
    type=miehefracmate
    params= 9.3907e+01  4.4034e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate136]
    type=miehefracmate
    params= 1.0482e+02  6.2999e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate137]
    type=miehefracmate
    params= 1.7075e+02  1.1166e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate138]
    type=miehefracmate
    params= 1.2410e+02  1.2432e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate139]
    type=miehefracmate
    params= 1.1513e+02  8.7935e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate140]
    type=miehefracmate
    params= 1.6385e+02  9.3064e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate141]
    type=miehefracmate
    params= 1.0879e+02  2.3470e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate142]
    type=miehefracmate
    params= 1.4214e+02  2.3528e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate143]
    type=miehefracmate
    params= 8.5894e+01  1.0900e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate144]
    type=miehefracmate
    params= 1.2740e+02  7.0196e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate145]
    type=miehefracmate
    params= 1.1668e+02  1.1209e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate146]
    type=miehefracmate
    params= 1.4397e+02  1.1310e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate147]
    type=miehefracmate
    params= 1.0582e+02  9.9073e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate148]
    type=miehefracmate
    params= 1.1998e+02  5.6406e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate149]
    type=miehefracmate
    params= 1.0046e+02  6.5802e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate150]
    type=miehefracmate
    params= 1.5839e+02  3.8704e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate151]
    type=miehefracmate
    params= 1.0127e+02  7.2056e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate152]
    type=miehefracmate
    params= 9.7541e+01  1.2045e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate153]
    type=miehefracmate
    params= 1.3567e+02  9.2246e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate154]
    type=miehefracmate
    params= 8.0028e+01  2.3066e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate155]
    type=miehefracmate
    params= 1.0914e+02  8.7764e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate156]
    type=miehefracmate
    params= 9.1569e+01  8.3127e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate157]
    type=miehefracmate
    params= 1.5285e+02  1.0759e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate158]
    type=miehefracmate
    params= 1.6171e+02  9.6339e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate159]
    type=miehefracmate
    params= 1.0767e+02  7.3653e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate160]
    type=miehefracmate
    params= 1.7912e+02  7.9748e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate161]
    type=miehefracmate
    params= 1.9733e+02  7.7277e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate162]
    type=miehefracmate
    params= 1.0830e+02  2.1564e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate163]
    type=miehefracmate
    params= 1.1517e+02  9.0763e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate164]
    type=miehefracmate
    params= 4.9451e+01  7.9501e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate165]
    type=miehefracmate
    params= 1.2870e+02  2.7391e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate166]
    type=miehefracmate
    params= 5.8182e+01  7.2268e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate167]
    type=miehefracmate
    params= 1.4432e+02  1.1249e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate168]
    type=miehefracmate
    params= 9.8293e+01  7.0477e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate169]
    type=miehefracmate
    params= 9.9357e+01  1.0495e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate170]
    type=miehefracmate
    params= 8.3601e+01  5.5116e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate171]
    type=miehefracmate
    params= 1.6721e+02  8.7598e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate172]
    type=miehefracmate
    params= 6.7527e+01  5.4880e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate173]
    type=miehefracmate
    params= 1.2848e+02  1.1263e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate174]
    type=miehefracmate
    params= 1.1902e+02  6.1368e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate175]
    type=miehefracmate
    params= 1.1934e+02  8.7093e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate176]
    type=miehefracmate
    params= 1.2276e+02  2.9009e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate177]
    type=miehefracmate
    params= 1.6867e+02  4.3830e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate178]
    type=miehefracmate
    params= 1.3128e+02  5.0504e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate179]
    type=miehefracmate
    params= 1.5510e+02  1.0078e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate180]
    type=miehefracmate
    params= 1.0316e+02  3.9045e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate181]
    type=miehefracmate
    params= 1.1709e+02  1.0247e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate182]
    type=miehefracmate
    params= 7.8068e+01  6.3109e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate183]
    type=miehefracmate
    params= 7.4296e+01  1.0622e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate184]
    type=miehefracmate
    params= 1.3621e+02  8.4554e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate185]
    type=miehefracmate
    params= 1.3490e+02  1.0309e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate186]
    type=miehefracmate
    params= 1.2586e+02  1.3580e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate187]
    type=miehefracmate
    params= 9.4137e+01  5.5464e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate188]
    type=miehefracmate
    params= 1.5290e+02  1.4227e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate189]
    type=miehefracmate
    params= 1.2483e+02  6.1180e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate190]
    type=miehefracmate
    params= 1.2270e+02  5.9703e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate191]
    type=miehefracmate
    params= 9.5117e+01  1.0103e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate192]
    type=miehefracmate
    params= 1.8445e+02  6.4110e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate193]
    type=miehefracmate
    params= 1.7538e+02  9.1256e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate194]
    type=miehefracmate
    params= 1.1884e+02  8.9891e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate195]
    type=miehefracmate
    params= 1.1374e+02  6.6340e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate196]
    type=miehefracmate
    params= 1.4065e+02  5.3237e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate197]
    type=miehefracmate
    params= 1.5814e+02  8.6397e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate198]
    type=miehefracmate
    params= 1.3462e+02  3.1512e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate199]
    type=miehefracmate
    params= 1.3996e+02  6.5601e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate200]
    type=miehefracmate
    params= 9.8443e+01  1.2870e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate201]
    type=miehefracmate
    params= 1.2375e+02  3.1040e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate202]
    type=miehefracmate
    params= 1.1414e+02  8.1900e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate203]
    type=miehefracmate
    params= 1.3046e+02  7.9273e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate204]
    type=miehefracmate
    params= 1.6227e+02  9.7376e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate205]
    type=miehefracmate
    params= 1.8068e+02  1.0136e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate206]
    type=miehefracmate
    params= 1.4550e+02  9.3705e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate207]
    type=miehefracmate
    params= 6.8092e+01  6.7648e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate208]
    type=miehefracmate
    params= 1.0645e+02  8.4645e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate209]
    type=miehefracmate
    params= 8.0868e+01  9.1646e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate210]
    type=miehefracmate
    params= 9.8997e+01  6.7221e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate211]
    type=miehefracmate
    params= 9.7811e+01  7.5311e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate212]
    type=miehefracmate
    params= 1.3433e+02  7.1361e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate213]
    type=miehefracmate
    params= 1.2084e+02  9.2804e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate214]
    type=miehefracmate
    params= 8.2654e+01  1.2164e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate215]
    type=miehefracmate
    params= 1.4977e+02  9.7190e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate216]
    type=miehefracmate
    params= 1.2527e+02  8.0336e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate217]
    type=miehefracmate
    params= 1.0358e+02  1.1030e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate218]
    type=miehefracmate
    params= 7.9724e+01  1.0127e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate219]
    type=miehefracmate
    params= 1.2604e+02  7.1607e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate220]
    type=miehefracmate
    params= 3.6216e+01  9.5790e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate221]
    type=miehefracmate
    params= 1.2965e+02  5.7289e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate222]
    type=miehefracmate
    params= 1.5229e+02  9.5389e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate223]
    type=miehefracmate
    params= 1.1303e+02  4.2947e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate224]
    type=miehefracmate
    params= 6.8287e+01  3.9009e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate225]
    type=miehefracmate
    params= 1.3402e+02  8.8824e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate226]
    type=miehefracmate
    params= 1.0953e+02  9.4465e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate227]
    type=miehefracmate
    params= 1.6621e+02  9.1237e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate228]
    type=miehefracmate
    params= 1.4867e+02  4.3577e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate229]
    type=miehefracmate
    params= 1.8467e+02  9.0824e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate230]
    type=miehefracmate
    params= 1.3241e+02  6.4412e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate231]
    type=miehefracmate
    params= 8.8688e+01  6.2770e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate232]
    type=miehefracmate
    params= 1.1139e+02  9.3502e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate233]
    type=miehefracmate
    params= 1.7266e+02  1.1848e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate234]
    type=miehefracmate
    params= 1.6299e+02  9.0470e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate235]
    type=miehefracmate
    params= 8.5555e+01  1.1210e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate236]
    type=miehefracmate
    params= 1.0862e+02  1.1387e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate237]
    type=miehefracmate
    params= 1.4862e+02  1.0350e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate238]
    type=miehefracmate
    params= 1.3883e+02  1.1069e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate239]
    type=miehefracmate
    params= 1.0362e+02  7.1923e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate240]
    type=miehefracmate
    params= 1.1101e+02  6.5357e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate241]
    type=miehefracmate
    params= 1.9267e+02  8.5892e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate242]
    type=miehefracmate
    params= 1.2319e+02  1.0749e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate243]
    type=miehefracmate
    params= 1.1076e+02  7.3953e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate244]
    type=miehefracmate
    params= 1.1524e+02  5.5347e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate245]
    type=miehefracmate
    params= 1.5861e+02  1.1593e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate246]
    type=miehefracmate
    params= 1.3887e+02  7.4696e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate247]
    type=miehefracmate
    params= 8.8105e+01  6.5135e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate248]
    type=miehefracmate
    params= 6.2465e+01  1.7116e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate249]
    type=miehefracmate
    params= 1.3803e+02  1.1826e+02  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
  [mymate250]
    type=miehefracmate
    params= 7.6434e+01  8.7978e+01  2.7000e-03  1.2000e-02  1.0000e-06
  [end]
[end]
