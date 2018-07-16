class StaticController < ApplicationController
  def index
    render json: { msg: 'success' }
  end

  # 将服务器数据写入文件
  def write
    url = params[:query][:url]
    dir_name = url.include?('5ab7c9627a7afd3099d16b4c/customer') ? 'shop' : 'seller'
    sn = (Dir.entries(Rails.root.join(dir_name)).length - 1).to_s.rjust(3, '0')
    file_name = Rails.root.join(dir_name, sn + '_' + URI(url).path.split('/')[4..-1].join('+') + '.json')
    result = JSON.parse(params[:result][:data].to_json)
    @data = {
      url: url,
      data: result.key?('message') ? nested_to_json(result) : result
    }
    write_data(file_name, @data)
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
      File.atomic_write(file_name) do |file|
        file.write(data.to_json)
      end
    end
end
