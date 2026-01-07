<?php

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Socks extends Model
{
    public $timestamps = false;

    protected $fillable = [
        'name',
        'description',
        'design',
        'image_url',
        'updated_at'
    ];

      public function getImageSrcAttribute(): string
        {
            if (Str::startsWith($this->image_url, ['http://', 'https://'])) {
                return $this->image_url;
            }

            return asset('storage/' . $this->image_url);
        }
    use HasFactory;
}
