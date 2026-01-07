<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('event_user', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('event_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();
            
            $table->unique(['event_id', 'user_id']);
            
            // Index pour améliorer les performances
            $table->index('event_id');
            $table->index('user_id');
        });
    }

    public function down()
    {
        Schema::dropIfExists('event_user');
    }
};