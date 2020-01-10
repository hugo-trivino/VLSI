###############################################################
#  Generated by:      Cadence Encounter 10.13-s292_1
#  OS:                Linux x86_64(Host ID saturn.ece.iit.edu)
#  Generated on:      Sun May  5 12:02:18 2019
#  Design:            cpu32
#  Command:           createClockTreeSpec -output encounter.cts -bufFootprin...
###############################################################
#
# Encounter(R) Clock Synthesis Technology File Format
#

#-- MacroModel --
#MacroModel pin <pin> <maxRiseDelay> <minRiseDelay> <maxFallDelay> <minFallDelay> <inputCap>


#-- Special Route Type --
#RouteTypeName specialRoute
#TopPreferredLayer 4
#BottomPreferredLayer 3
#PreferredExtraSpace 1
#End

#-- Regular Route Type --
#RouteTypeName regularRoute
#TopPreferredLayer 4
#BottomPreferredLayer 3
#PreferredExtraSpace 1
#End

#-- Clock Group --
#ClkGroup
#+ <clockName>


#------------------------------------------------------------
# Clock Root   : clk
# Clock Name   : clk
# Clock Period : 4ns
#------------------------------------------------------------
AutoCTSRootPin clk
Period         4ns
MaxDelay       0.01ns # sdc driven default
MinDelay       0ns # sdc driven default
MaxSkew        160ps # sdc driven default
SinkMaxTran    200ps # sdc driven default
BufMaxTran     200ps # sdc driven default
Buffer         INVX8 INVX4
NoGating       NO
DetailReport   YES
#SetDPinAsSync  NO
#SetIoPinAsSync NO
#SetASyncSRPinAsSync  NO
#SetTriStEnPinAsSync NO
#SetBBoxPinAsSync NO
RouteClkNet    YES
PostOpt        YES
OptAddBuffer   YES
#RouteType      specialRoute
#LeafRouteType  regularRoute
END

