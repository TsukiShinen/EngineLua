local Debug = {}

function Debug:Start(pOn)
  if pOn then
    function Debug:Log(pMsg)
      print("[Log] "..pMsg)
    end
    function Debug:Error(pMsg)
      print("[Error] "..pMsg)
    end
  else
    function Debug:Log() end
    function Debug:Error() end
  end
end


return Debug