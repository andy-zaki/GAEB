using AngularProjectApi.Data;
using AngularProjectApi.Models;
using FluentValidation;
using Microsoft.EntityFrameworkCore;

namespace AngularProjectApi.Validators;

public sealed class EducationalBuildingValidator : AbstractValidator<EducationalBuilding>
{
    public EducationalBuildingValidator(ApplicationDbContext context)
    {
        RuleFor(x => x.BuildingNumber)
            .NotEmpty()
            .WithMessage("رقم قطعة الأرض مطلوب.")
            .Must(v => int.TryParse(v, out var n) && n > 0)
            .WithMessage("رقم قطعة الأرض يجب أن يكون رقمًا صحيحًا.")
            .MustAsync(async (building, buildingNumber, ct) =>
            {
                if (!int.TryParse(buildingNumber, out _))
                {
                    return true;
                }

                return !await context.EducationalBuildings.AsNoTracking().AnyAsync(e => e.BuildingNumber == buildingNumber, ct);
            })
            .WithMessage("يوجد بالفعل مبنى بنفس رقم قطعة الأرض.");

        RuleFor(x => x.BuildingName)
            .NotEmpty()
            .WithMessage("مسمى قطعة الأرض مطلوب.");

        RuleFor(x => x.TotalArea)
            .NotNull()
            .WithMessage("المساحة الكلية مطلوبة.")
            .GreaterThan(0)
            .WithMessage("المساحة الكلية مطلوبة.");

        RuleFor(x => x.DistrictId)
            .NotNull()
            .WithMessage("المركز / القسم مطلوب.")
            .MustAsync(async (districtId, ct) =>
            {
                if (districtId == null)
                {
                    return true;
                }

                return await context.District.AsNoTracking().AnyAsync(d => d.Number == districtId, ct);
            })
            .WithMessage("المركز / القسم غير موجود.");

        RuleFor(x => x.VillageId)
            .NotNull()
            .WithMessage("القرية / الحي مطلوب.")
            .MustAsync(async (villageId, ct) =>
            {
                if (villageId == null)
                {
                    return true;
                }

                return await context.Villages.AsNoTracking().AnyAsync(v => v.Number == villageId, ct);
            })
            .WithMessage("القرية / الحي غير موجود.");

        RuleFor(x => x)
            .MustAsync(async (building, ct) =>
            {
                if (building.DistrictId == null || building.VillageId == null)
                {
                    return true;
                }

                var village = await context.Villages.AsNoTracking().FirstOrDefaultAsync(v => v.Number == building.VillageId, ct);
                if (village == null)
                {
                    return true;
                }

                return village.DistrictNumber == building.DistrictId;
            })
            .WithMessage("القرية / الحي لا يتبع المركز / القسم المختار.");

        RuleFor(x => x.LandOwnership)
            .NotEmpty()
            .WithMessage("مالك الأرض مطلوب.")
            .Must(v => int.TryParse(v, out var n) && n > 0)
            .WithMessage("مالك الأرض مطلوب.")
            .MustAsync(async (building, landOwnership, ct) =>
            {
                if (!int.TryParse(landOwnership, out var landOwnerId))
                {
                    return true;
                }

                return await context.LandOwner.AsNoTracking().AnyAsync(l => l.Id == landOwnerId, ct);
            })
            .WithMessage("مالك الأرض غير موجود.");
    }
}
