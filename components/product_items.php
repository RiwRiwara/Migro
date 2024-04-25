<?php
// Include database configuration
require_once 'config/db.php';

// Check if category query parameter is set
$category = isset($_GET['category']) ? $_GET['category'] : '';


try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Construct SQL query based on category parameter
    $sql = "SELECT * FROM Products";
    if (!empty($category)) {
        $sql .= " WHERE Category = :category";
    }
    $stmt = $conn->prepare($sql);
    if (!empty($category)) {
        $stmt->bindParam(':category', $category);
    }
    $stmt->execute();
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($products as $product) {
        $image = '/public/images/' . 'mockup' . '.jpg';
        // $image = '/public/images/' . $product['ImageURL'] . '.jpg';
        echo '
                                    <div class="w-full max-w-sm bg-white border border-gray-200 rounded-lg shadow">
                                        <div>
                                            <img class="p-8 rounded-md" src="' . $image . '" alt="product image" />
                                        </div>
                                        <div class="px-5 pb-5">
                                            <h5 class="text-xl font-semibold tracking-tight text-gray-900">' . $product['Name'] . '</h5>
                                            <div class="flex items-center mt-4">
                                                <span class="text-3xl font-bold text-gray-900">$' . $product['Price'] . '</span>
                                                <span class="text-gray-400 text-sm ml-2">' . $product['Unit'] . '</span>
                                            </div>
                                            <button class="bg-blue-500 text-white py-2 px-4 mt-4 rounded">Add to Cart</button>
                                        </div>
                                    </div>';
    }
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
