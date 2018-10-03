module ApplicationHelper

  def default_meta_tags
    {
      site: 'アプリ速報は流行や旬な話題をいち早く届けるメディアです',
      title: '流行をいち早くお届けするアプリ速報',
      reverse: true,
      viewport: "width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no",
      charset: 'utf-8',
      description: 'アプリ速報は旬な情報をお届けするウェブサイトです。あなたにとって素敵な情報が見つかると思いますよ。今すぐチェックしよう！',
      keywords: 'メディア, アプリ,流行, インスタ映え, インスタグラム, SNS,吉澤ひとみ, 大谷翔平,ハロウィン, クリスマス, 海外旅行, 高校生, 大学生 カップル, 彼女, 恋人, デートスポット, マッチング, 掲示板, ２チャンネル, LINE, FACEBOOK, TIKTOK',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('icon.png') }, # TODO あとで設定
        { href: image_url('icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'アプリ速報',
        title: '流行や旬な話題をいち早く届けるメディアのアプリ速報です',
        description: 'あなたにとって素敵な情報が見つかると思いますよ。今すぐチェックしよう！',
        type: 'article',
        url: request.original_url,
        image: image_url('icon.png'), # TODO あとで設定
        locale: 'ja_JP',
      },
      fb: {
        app_id: '336855070210588'
      },
      twitter: {
        card: 'summary',
        site: '@appsoku',
      }
    }
  end
end
