<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Events extends Model
{
   
    use HasFactory;

     const UPDATED_AT = null;

    protected $fillable = [
        'type',
        'title', 
        'event_date',
        'location',
        'description',
        'slots_available',
        'max_slots'
    ];

    protected $casts = [
        'event_date' => 'datetime'
    ];

    public function users()
    {
        return $this->belongsToMany(User::class, 'event_user', 'event_id', 'user_id');
    }

    public function isUserRegistered($userId)
    {
        return $this->users()->where('user_id', $userId)->exists();
    }
}