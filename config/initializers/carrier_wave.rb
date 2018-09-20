
# 本番の画像サーバー設定
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => "ap-northeast-1",     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'], # 環境変数を付与する
      :aws_secret_access_key => ENV['S3_SECRET_KEY']  # secrets.S3_SECRET_KEYでsecrets.ymlから読み込める?
    }
    config.fog_directory     =  "20180830-natsuki-koki"
  end
end

# 本番サーバーに環境変数を与える
