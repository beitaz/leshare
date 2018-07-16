class StaticController < ApplicationController
  def index
    render json: { msg: 'success' }
  end

  # 将服务器数据写入文件
  def write
    url = params[:query][:url]
    dir_name = url.include?('5ab7c9627a7afd3099d16b4c/customer') ? 'shop' : 'seller'
    sn = (dir_children(Rails.root.join(dir_name)).length + 1).to_s.rjust(3, '0')
    file_name = URI(url).path.split('/')[4..-1].join('-') + '.json'
    result = JSON.parse(params[:result][:data].to_json)
    @data = {
      url: url,
      data: !result.instance_of?(Array) && result.key?('message') ? nested_to_json(result) : result
    }
    write_data(Rails.root.join(dir_name, sn + '_' + file_name), @data) unless include_file?(Rails.root.join(dir_name, file_name))
  end

  private

    # 将 json 字符串转为正常的 json 对象
    def nested_to_json(json)
      message = JSON.parse(json['message'])
      if message.key?('components')
        message['components'].each do |component|
          component['param'] = JSON.parse(component['param']) if component.key?('param') && component['param'].present?
          component['data'] = JSON.parse(component['data']) if component.key?('data') && component['data'].present?
        end
      end
      json[:message] = message
    end

    # 写文件
    def write_data(file_name, data)
      # file_name = '/Users/quoyi/Workspace/weixin/leshare/shop/test.json'
      File.atomic_write(file_name) do |file|
        file.write(data.to_json)
      end
    end

    # 获取指定目录下子文件名数组(非递归)
    def dir_children(dir_name)
      Dir.entries(dir_name).delete_if { |name| ['.', '..'].include?(name) }
    end

    # 判断指定文件名(全路径)所在目录是否包含此文件
    def include_file?(file_name)
      # file_name = '/Users/quoyi/Workspace/weixin/leshare/shop/goods+0.json'
      dir_name = File.dirname(file_name)
      base_name = File.basename(file_name)
      dir_children(dir_name).find { |name| name.include?(base_name) }.present?
    end
end
