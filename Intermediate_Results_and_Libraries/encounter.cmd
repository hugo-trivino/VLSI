#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Sat May  4 16:14:24 2019                #
#                                                     #
#######################################################

#@(#)CDS: Encounter v10.13-s292_1 (32bit) 08/15/2012 15:12 (Linux 2.6)
#@(#)CDS: NanoRoute v10.13-s033 NR120726-2234/10_10_USR3-UB (database version 2.30, 132.4.1) {superthreading v1.16}
#@(#)CDS: CeltIC v10.13-s064_1 (32bit) 06/28/2012 06:48:30 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: AAE 10.13-s008 (32bit) 08/15/2012 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CTE 10.13-s020_1 (32bit) Aug 15 2012 06:35:34 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CPE v10.13-s240

loadConfig ./encounter.conf
commitConfig
floorPlan -r 1.0 0.6 40.05 40.8 40.05 42
addRing -spacing_bottom 9.9 -width_left 9.9 -width_bottom 9.9 -width_top 9.9 -spacing_top 9.9 -layer_bottom metal1 -width_right 9.9 -around core -center 1 -layer_top metal1 -spacing_right 9.9 -spacing_left 9.9 -layer_right metal2 -layer_left metal2 -offset_top 9.9 -offset_bottom 9.9 -offset_left 9.9 -offset_right 9.9 -nets { gnd vdd }
amoebaPlace
sroute -noBlockPins -noPadRings
trialRoute
buildTimingGraph
setCteReport
report_timing -nworst  10 -net > timing.rep.1.placed
setOptMode -mediumEffort -fixDRC -addPortAsNeeded
initECO ./ipo1.txt
endECO
buildTimingGraph
setCteReport
report_timing -nworst  10 -net > timing.rep.2.ipo1
createClockTreeSpec -output encounter.cts -bufFootprint buf -invFootprint inv
specifyClockTree -clkfile encounter.cts
ckSynthesis -rguide cts.rguide -report report.ctsrpt -macromodel report.ctsmdl -fix_added_buffers
trialRoute -highEffort -guide cts.rguide
extractRC
reportClockTree -postRoute -localSkew -report skew.post_troute_local.ctsrpt
reportClockTree -postRoute -report report.post_troute.ctsrpt
setAnalysisMode -setup -async -skew -autoDetectClockTree
buildTimingGraph
setCteReport
report_timing -nworst  10 -net > timing.rep.3.cts
setOptMode -highEffort -fixDrc -addPortAsNeeded -incrTrialRoute -restruct -topomap
initECO ipo2.txt
setExtractRCMode -default -assumeMetFill
extractRC
setExtractRCMode -detail -assumeMetFill
extractRC
endECO
cleanupECO
buildTimingGraph
setCteReport
report_timing -nworst  10 -net > timing.rep.4.ipo2
addFiller -cell FILL -prefix FILL -fillBoundary
globalNetConnect vdd -type tiehi
globalNetConnect vdd -type pgpin -pin vdd -override
globalNetConnect gnd -type tielo
globalNetConnect gnd -type pgpin -pin gnd -override
globalDetailRoute
setExtractRCMode -detail -noReduce
extractRC
buildTimingGraph
setCteReport
report_timing -nworst  10 -net > timing.rep.5.final
streamOut final.gds2 -mapFile gds2_encounter.map -stripes 1 -units 1000 -mode ALL
saveNetlist -excludeLeafCell final.v
rcOut -spf final.dspf
verifyGeometry
verifyConnectivity -type all
reportGateCount -limit 0 -outfile area.final
report_power -outfile power.final
