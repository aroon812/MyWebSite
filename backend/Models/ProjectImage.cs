public class ProjectImage
{
    public long Id { get; set; }
    public virtual Project Project { get; set; }
    public string Description { get; set; }
    public byte[] Image { get; set; }
    public string Secret { get; set; }
}