<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemPizzaPedidosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('item_pizza_pedidos', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('item_pedido')->unsigned();
            $table->foreign('item_pedido')->references('id')->on('item_pedido_deliveries')->onDelete('cascade');
            
            $table->integer('sabor_id')->unsigned();
            $table->foreign('sabor_id')->references('id')->on('produto_deliveries')->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('item_pizza_pedidos');
    }
}
