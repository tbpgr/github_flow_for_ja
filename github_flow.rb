# encoding: UTF-8
require 'gviz'

basic_settings = {fontname:'MS GOTHIC', fontsize: 11}
basic_node = {fontname:'MS GOTHIC', shape: :box, style: :filled, :colorscheme=> :paired12 }
diamond_format =  basic_node.merge({label: '', shape: :diamond, fillcolor: :black})

Graph do
  color = 0
  global layout:'dot', overlap:false, colorscheme: :brbg9

  node :master1, {label: 'master', fillcolor: color=color.succ%11}.merge(basic_node)
  node :topicBranch, {label: 'topic_branch', fillcolor: color=color.succ%11}.merge(basic_node)
  node :dev, {label: '設計開発', fillcolor: color=color.succ%11}.merge(basic_settings).merge(basic_node)
  node :commit, {fillcolor: color=color.succ%11}.merge(basic_node)
  node :pushToRemote, {label: 'push to remote', fillcolor: color=color.succ%11}.merge(basic_node)
  node :topicBranch, {label: 'トピックブランチの作成'}.merge(basic_node)

  node :branchNormal, diamond_format
  node :branchWip, diamond_format
  node :branchConsultation, diamond_format
  node :branchReview, diamond_format

  node :wipPullRequest, {label: '[WIP]Pull Request', fillcolor: color=color.succ%11}.merge(basic_node)
  node :pullRequest, {label: 'Pull Request', fillcolor: color%11}.merge(basic_node)
  node :consultation, {label: 'レビュー・相談', fillcolor: color=color.succ%11}.merge(basic_node)
  node :review, {label: 'レビュー', fillcolor: color%11}.merge(basic_node)
  node :merge, {label: 'マージ', fillcolor: color=color.succ%11}.merge(basic_node)
  node :closePullRequest, {label: 'Pull Request Close', fillcolor: color=color.succ%11}.merge(basic_node)
  node :master2, {label: 'master', fillcolor: color%11}.merge(basic_node)
  node :deleteTopicBranch, basic_node.merge({label: 'トピックブランチ削除', fillcolor: color=color.succ%11, fontcolor: :white})
  node :deploy, basic_node.merge({label: 'デプロイ', fillcolor: color%11, fontcolor: :white})

  edge :start_master1
  edge :master1_master2
  edge :master1_topicBranch, {label: '機能追加・バグフィックス'}.merge(basic_settings)
  edge :topicBranch_dev, basic_settings
  edge :dev_commit, basic_settings
  edge :commit_pushToRemote, basic_settings
  edge :pushToRemote_branchNormal, {label: 'トピックの実装が完了したか？'}.merge(basic_settings)
  edge :branchNormal_pullRequest, {label: '完了'}.merge(basic_settings)
  edge :branchNormal_dev, {label: '完了'}.merge(basic_settings)
  edge :pushToRemote_branchWip, {label: '設計・実装上の相談があるか？'}.merge(basic_settings)
  edge :branchWip_wipPullRequest, {label: 'ある'}.merge(basic_settings)
  edge :branchWip_dev, {label: 'ない'}.merge(basic_settings)
  edge :wipPullRequest_consultation, basic_settings
  edge :consultation_branchConsultation, {label: '設計・実装の課題が解決したか？'}.merge(basic_settings)
  edge :branchConsultation_dev, {label: '解決'}.merge(basic_settings)
  edge :branchConsultation_consultation, {label: '未解決'}.merge(basic_settings)
  edge :pullRequest_review, basic_settings
  edge :review_branchReview, {label: 'レビューOK？'}.merge(basic_settings)
  edge :branchReview_merge, {label: '解決'}.merge(basic_settings)
  edge :branchReview_review, {label: 'NG'}.merge(basic_settings)
  edge :merge_closePullRequest, basic_settings
  edge :merge_master2, basic_settings
  edge :closePullRequest_deleteTopicBranch, basic_settings
  edge :master2_end
  edge :master2_deploy

  rank :min, :start
  rank :max, :end

  save(:github_flow, :png)
end
