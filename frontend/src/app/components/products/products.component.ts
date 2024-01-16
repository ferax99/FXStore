import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit, inject } from '@angular/core';
import { isEqual } from 'lodash';

@Component({
  selector: 'app-products',
  standalone: true,
  imports: [HttpClientModule],
  templateUrl: './products.component.html',
  styleUrl: './products.component.css'
})




export class ProductsComponent implements OnInit{

  httplClient = inject(HttpClient);
  ngOnInit(): void {
    this.fetchData();
  }
  fetchData(){
    this.httplClient.get('localhost:8080/product').subscribe((data:any)=>{
      console.log(data);
    })
  }
   products = [
    {id:1,name:'apple',price:300,categorie:[
      'fruit',
      'red',
      'fresh'
      ]},
    {id:2,name:'pear',price:400,categorie:[
      'fruit',
      'green',
      'fresh',
 
    ]},
    {id:3,name:'pineaple',price:1300,categorie:[
      'fruit',
      'red',

    ]},
    {id:4,name:'banana',price:400,categorie:[
      'fruit',

    ]}
  ];
 original:any = JSON.parse(JSON.stringify(this.products));
 changes= this.products.map(()=>false)

 categories = [
  'electronics',
  'clothing',
  'home_decor',
  'sports_outdoors',
  'books',
  'health_beauty',
  'toys_games',
  'automotive',
  'pet_supplies',
  'food_grocery',
];
  test = (object:any, a:any)=>{

    if (confirm("Delete categorie?")) {
      object.categorie.splice(a, 1);
    } 

    this.check_changes(object.id-1);
    

  };
  
  check_changes(i:number){
    console.log( this.original)
    console.log(this.products)
    if (isEqual(this.products, this.original)==false){ this.changes[i]=true}
    else{
      console.log('puede entrar aca otra vez???')
       this.changes[i]=false}
  }
  on_change(e:any,i:number,object:string,product:any){
    let value = e.target.textContent; 
    object==='price'?product.price = Number(value): product.name =value;    
    this.check_changes(i)
  }

}
