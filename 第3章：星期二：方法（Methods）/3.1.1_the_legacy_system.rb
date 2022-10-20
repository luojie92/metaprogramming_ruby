# 老系统

# 蹩脚的代码
class DS
  def initialize
    # DB
  end

  def get_cpu_info(workstation_id)
    "#{workstation_id} 2.9 Ghz quad-core"
  end

  def get_cpu_price(workstation_id)
    100 + workstation_id
  end

  def get_mouse_info(workstation_id)
    "#{workstation_id} Wireless Touch"
  end

  def get_mouse_price(workstation_id)
    100 + workstation_id
  end
end

ds = DS.new
ds.get_cpu_info(42)
ds.get_cpu_price(42)
ds.get_mouse_info(42)
ds.get_mouse_info(42)
