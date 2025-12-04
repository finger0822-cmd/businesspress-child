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
<<<<<<< HEAD
?>
=======
?>
>>>>>>> 4e42d9a6478c95f0bccfb87834b3b0a7460a3148
