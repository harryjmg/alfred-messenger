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
      "#F2F2F2"
    when "Inquiétude"
      "#D8D8D8"
    when "Anxiété"
      "#A4A4A4"
    else
      "white"
    end
  end

  def bg_for_bool bool
    bool ? "#81DAF5" : "#D8F781"
  end

  def color_potential_flow moy
    case moy
    when 0..20
      "#F2F2F2"
    when 21..40
      "#E6E6E6"
    when 41..60
      "#D8D8D8"
    when 61..80
      "#BDBDBD"
    when 81..100
      "#A4A4A4"
    end
  end

  def potential_to_text moy
    case moy
    when 0..20
      "Tres faible"
    when 21..40
      "Faible"
    when 41..60
      "Neutre"
    when 61..80
      "Fort"
    when 81..100
      "Tres fort"
    end
  end
end
