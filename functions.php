<?php
/**
 * Lightning Child Theme Functions
 */

// スタイルシートの読み込み
add_action( 'wp_enqueue_scripts', 'lightning_child_enqueue_styles' );
function lightning_child_enqueue_styles() {
  wp_enqueue_style( 'parent-style', get_template_directory_uri() . '/style.css' );
  wp_enqueue_style( 'child-style', get_stylesheet_directory_uri() . '/style.css', array('parent-style') );
}

// 詳細デバッグ: 読み込まれているテンプレート情報を出力
add_action('wp_head', 'lightning_child_debug_template_head', 999);
function lightning_child_debug_template_head() {
  if (is_page()) {
    $template = get_page_template();
    $child_dir = get_stylesheet_directory();
    $parent_dir = get_template_directory();
    $page_id = get_the_ID();
    $page_slug = get_page_uri();
    
    echo "<!-- ========== テンプレート読み込みデバッグ情報 START ========== -->\n";
    echo "<!-- 読み込み時刻: " . date('Y-m-d H:i:s') . " -->\n";
    echo "<!-- ページID: " . $page_id . " -->\n";
    echo "<!-- ページスラッグ: " . $page_slug . " -->\n";
    echo "<!-- 使用テンプレート: " . $template . " -->\n";
    echo "<!-- 子テーマディレクトリ: " . $child_dir . " -->\n";
    echo "<!-- 親テーマディレクトリ: " . $parent_dir . " -->\n";
    
    // テンプレート階層の確認
    $template_hierarchy = get_page_template_hierarchy();
    echo "<!-- テンプレート階層: " . implode(', ', $template_hierarchy) . " -->\n";
    
    // 実際に読み込まれているファイルの確認
    if ($template && file_exists($template)) {
      echo "<!-- テンプレートファイル存在: YES -->\n";
      echo "<!-- テンプレートファイルパス: " . $template . " -->\n";
      echo "<!-- テンプレートファイル更新時刻: " . date('Y-m-d H:i:s', filemtime($template)) . " -->\n";
      echo "<!-- テンプレートファイルサイズ: " . filesize($template) . " bytes -->\n";
      
      // ファイルの一部を読み込んで内容を確認（最初の200文字）
      $file_content = file_get_contents($template, false, null, 0, 200);
      $file_hash = md5(substr($file_content, 0, 200));
      echo "<!-- テンプレートファイル内容ハッシュ（最初200文字）: " . $file_hash . " -->\n";
    } else {
      echo "<!-- テンプレートファイル存在: NO -->\n";
    }
    
    // page-ouchi-support.phpの存在確認
    $ouchi_template = $child_dir . '/page-ouchi-support.php';
    if (file_exists($ouchi_template)) {
      echo "<!-- page-ouchi-support.php存在: YES -->\n";
      echo "<!-- page-ouchi-support.phpパス: " . $ouchi_template . " -->\n";
      echo "<!-- page-ouchi-support.php更新時刻: " . date('Y-m-d H:i:s', filemtime($ouchi_template)) . " -->\n";
    } else {
      echo "<!-- page-ouchi-support.php存在: NO -->\n";
    }
    
    echo "<!-- ========== テンプレート読み込みデバッグ情報 END ========== -->\n";
  }
}

// フッターにも簡易デバッグ情報を出力
add_action('wp_footer', 'lightning_child_debug_template_footer', 999);
function lightning_child_debug_template_footer() {
  if (is_page()) {
    $template = get_page_template();
    echo "<!-- [デバッグ] 読み込まれたテンプレート: " . basename($template) . " -->\n";
    echo "<!-- [デバッグ] 完全パス: " . $template . " -->\n";
  }
}
