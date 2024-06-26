<?php

require __DIR__ . '/vendor/autoload.php';
require_once 'router.php';

use Monolog\Logger;
use Monolog\Handler\StreamHandler;

$log = new Logger('my_app');
$log->pushHandler(new StreamHandler('app.log'));

$log->info('Hello from my PHP project!');



get('/', 'views/home.php');
get('/cart', 'views/cart.php');
get('/products', 'views/products.php');
get('/checkout', 'views/checkout.php');
get('/order-success', 'views/order-success.php');

get('/product/$ProductID', 'controllers/getProductById.php');
post('/checkout-items', 'controllers/checkout.php');
get('/sendmail', 'controllers/sendMail.php');


get('/404', 'views/404.php');
