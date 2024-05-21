<?php
declare(strict_types=1);

namespace KTPM\UserTest;

use PHPUnit\Framework\TestCase;
use KTPM\Product;

class ProductTest extends TestCase
{
    public function testIncreaseQuantityInProduct(): void
    {
        //Given
        $laptop = new Product("Asus Laptop", 2);

        //When
        $laptop->increaseQuantity(2);

        //Then
        self::assertSame(4, $laptop->getQuantity());
    }
}