﻿// <auto-generated />
using System;
using AxMonar;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace AxMonar.Migrations
{
    [DbContext(typeof(AplicacionDBContext))]
    partial class AplicacionDBContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.10")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("AxMonar.Models.Cuenta", b =>
                {
                    b.Property<long>("Cvu")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Alias")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Dni")
                        .HasColumnType("int");

                    b.Property<int>("IdTipoMoneda")
                        .HasColumnType("int");

                    b.Property<double>("Saldo")
                        .HasColumnType("float");

                    b.HasKey("Cvu");

                    b.ToTable("Cuenta");
                });

            modelBuilder.Entity("AxMonar.Models.Deposito", b =>
                {
                    b.Property<int>("IdDeposito")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<long>("Cvu")
                        .HasColumnType("bigint");

                    b.Property<DateTime>("Fecha")
                        .HasColumnType("datetime2");

                    b.Property<float>("Monto")
                        .HasColumnType("real");

                    b.HasKey("IdDeposito");

                    b.ToTable("Deposito");
                });

            modelBuilder.Entity("AxMonar.Models.Destino", b =>
                {
                    b.Property<string>("AliasDestino")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Correo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("DniDestino")
                        .HasColumnType("int");

                    b.Property<string>("Propietario")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("AliasDestino");

                    b.ToTable("Destino");
                });

            modelBuilder.Entity("AxMonar.Models.TipoMoneda", b =>
                {
                    b.Property<int>("IdTipoMoneda")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("NombreTipoMoneda")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("IdTipoMoneda");

                    b.ToTable("TipoMoneda");
                });

            modelBuilder.Entity("AxMonar.Models.Transferencia", b =>
                {
                    b.Property<int>("IdTransferencia")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("AliasDestino")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<long>("Cvu")
                        .HasColumnType("bigint");

                    b.Property<DateTime>("Fecha")
                        .HasColumnType("datetime2");

                    b.Property<double>("Monto")
                        .HasColumnType("float");

                    b.Property<string>("Nota")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("IdTransferencia");

                    b.ToTable("Transferencia");
                });

            modelBuilder.Entity("AxMonar.Models.Usuario", b =>
                {
                    b.Property<int>("Dni")
                        .HasColumnType("int");

                    b.Property<string>("Apellido")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Correo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Dni");

                    b.ToTable("Usuario");
                });
#pragma warning restore 612, 618
        }
    }
}
