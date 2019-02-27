module ApplicationHelper
  def bg_for_feelings level
    case level
    when 0
      "#F78181"
    when 1
      "#F7BE81"
    when 2
      "#D8F781"
    when 3
      "#9FF781"
    when 4
      "#81DAF5"
    when 5
      "#58ACFA"
    else
      "white"
    end
  end

  def bg_for_feelings_ten level
    level /= 2 if level
    case level
    when 0
      "#F78181"
    when 1
      "#F7BE81"
    when 2
      "#D8F781"
    when 3
      "#9FF781"
    when 4
      "#81DAF5"
    when 5
      "#58ACFA"
    else
      "white"
    end
  end

  def bg_for_state state
    case state
    when "Flow"
      "#81DAF5"
    when "Stimulé"
      "#58ACFA"
    when "Controle"
      "#CEECF5"
    when "Relaxation"
      "#9FF781"
    when "Ennui"
      "#CEF6CE"
    when "Apathie"
      "#D8D8D8"
    when "Inquiétude"
      "#A4A4A4"
    when "Anxiété"
      "#585858"
    else
      "white"
    end
  end

  def bg_for_bool bool
    bool ? "#81DAF5" : "#D8F781"
  end
end
