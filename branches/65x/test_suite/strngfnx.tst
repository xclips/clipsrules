(unwatch all)
(clear)
(set-strategy depth)
(open "Results//strngfnx.rsl" strngfnx "w")
(dribble-on "Actual//strngfnx.out")
(batch "strngfnx.bat")
(dribble-off)
(load "compline.clp")
(printout strngfnx "strngfnx.bat differences are as follows:" crlf)
(compare-files "Expected//strngfnx.out" "Actual//strngfnx.out" strngfnx)
; close result file
(close strngfnx)