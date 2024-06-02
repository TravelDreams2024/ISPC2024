export class Destino
{
    id!:Number;
    image!: String;
    name!: String;
    description!:String; 
    precio!:String;

    constructor(id:number, image:string, name:string, description:string, precio: string)
    {
        this.id=id;
        this.image=image;
        this.name=name;
        this.description=description;
        this.precio=precio;
    }
}