export class Profesional
{
    id!:Number;
    name!: String;
    perfil!:String; 
    photo!:String;

    constructor(id:number, name:string, perfil:string, photo:string)
    {
        this.id=id;
        this.name=name;
        this.perfil=perfil;
        this.photo=photo;
    }
}