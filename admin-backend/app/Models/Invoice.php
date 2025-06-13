<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $table = 'invoices';
    
    protected $fillable = [
        'invoice_number', 'checkout_id', 'invoice_date', 'due_date',
        'status', 'notes', 'terms'
    ];
    
    protected $casts = [
        'invoice_date' => 'date',
        'due_date' => 'date',
    ];
    
    public function checkout()
    {
        return $this->belongsTo(CheckoutMaster::class, 'checkout_id');
    }
    
    public function items()
    {
        return $this->hasMany(InvoiceItem::class, 'invoice_id');
    }
}