using AngularProjectApi.Models;
using FluentValidation;

namespace AngularProjectApi.Validators;

public sealed class LandTechnicalInspectionValidator : AbstractValidator<LandTechnicalInspection>
{
    public LandTechnicalInspectionValidator()
    {
        RuleFor(x => x.LandCode)
            .GreaterThan(0)
            .WithMessage("كود قطعة الأرض مطلوب.");

        RuleFor(x => x.GovernorateCode)
            .GreaterThan(0)
            .WithMessage("كود المحافظة مطلوب.");

        RuleFor(x => x.LandAddress)
            .NotEmpty()
            .WithMessage("عنوان قطعة الأرض مطلوب.");

        RuleFor(x => x.LandOwnerName)
            .NotEmpty()
            .WithMessage("اسم مالك الأرض مطلوب.");

        RuleFor(x => x.LandOwnerAddress)
            .NotEmpty()
            .WithMessage("عنوان مالك الأرض مطلوب.");

        RuleFor(x => x.TotalArea)
            .GreaterThan(0)
            .WithMessage("مساحة الأرض مطلوبة.");

        RuleFor(x => x.LandNature)
            .NotEmpty()
            .WithMessage("طبيعة الأرض مطلوبة.");

        RuleFor(x => x.LandOwnershipCode)
            .GreaterThan(0)
            .WithMessage("كود الملكية مطلوب.");

        RuleFor(x => x.NorthernBoundary)
            .NotEmpty()
            .WithMessage("الحد الشمالي مطلوب.");
        RuleFor(x => x.NorthernBoundaryLength)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("طول الحد الشمالي مطلوب.");

        RuleFor(x => x.SouthernBoundary)
            .NotEmpty()
            .WithMessage("الحد الجنوبي مطلوب.");
        RuleFor(x => x.SouthernBoundaryLength)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("طول الحد الجنوبي مطلوب.");

        RuleFor(x => x.EasternBoundary)
            .NotEmpty()
            .WithMessage("الحد الشرقي مطلوب.");
        RuleFor(x => x.EasternBoundaryLength)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("طول الحد الشرقي مطلوب.");

        RuleFor(x => x.WesternBoundary)
            .NotEmpty()
            .WithMessage("الحد الغربي مطلوب.");
        RuleFor(x => x.WesternBoundaryLength)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("طول الحد الغربي مطلوب.");

        RuleFor(x => x.NortheastBoundary)
            .NotEmpty()
            .WithMessage("الحد الشمال الشرقي مطلوب.");
        RuleFor(x => x.NortheastBoundaryLength)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("طول الحد الشمال الشرقي مطلوب.");

        RuleFor(x => x.NorthwestBoundary)
            .NotEmpty()
            .WithMessage("الحد الشمال الغربي مطلوب.");
        RuleFor(x => x.NorthwestBoundaryLength)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("طول الحد الشمال الغربي مطلوب.");

        RuleFor(x => x.SoutheastBoundary)
            .NotEmpty()
            .WithMessage("الحد الجنوب الشرقي مطلوب.");
        RuleFor(x => x.SoutheastBoundaryLength)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("طول الحد الجنوب الشرقي مطلوب.");

        RuleFor(x => x.SouthwestBoundary)
            .NotEmpty()
            .WithMessage("الحد الجنوب الغربي مطلوب.");
        RuleFor(x => x.SouthwestBoundaryLength)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("طول الحد الجنوب الغربي مطلوب.");

        RuleFor(x => x.TechnicalResponsiblePersonId)
            .Must(v => v.HasValue && v.Value != Guid.Empty)
            .WithMessage("رقم المسؤول الفني مطلوب.");

        RuleFor(x => x.LegalResponsiblePersonId)
            .Must(v => v.HasValue && v.Value > 0)
            .WithMessage("رقم المسؤول القانوني مطلوب.");

        RuleFor(x => x.NeedsCommitteeDate)
            .NotNull()
            .WithMessage("تاريخ لجنة الاحتياج مطلوب.");

        RuleFor(x => x.TechnicalInspectionDate)
            .NotNull()
            .WithMessage("تاريخ المعاينة الفنية مطلوب.");
    }
}
